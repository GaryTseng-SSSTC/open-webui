"""
title: Custom RAG Pipe
author: Your Name
version: 0.1.0
description: A pipe that forwards requests to a custom RAG API
"""

import requests
from typing import Optional, Generator, Union
from pydantic import BaseModel, Field


class Pipe:
    """
    Custom RAG Pipe - 將請求轉送到自訂的 RAG API 進行處理
    """

    class Valves(BaseModel):
        """可在管理面板中配置的設定"""
        rag_api_url: str = Field(
            default="http://127.0.0.1:8000/ssstc/rag",
            description="RAG API 的 URL"
        )
        collection_name: str = Field(
            default="default_collection",
            description="知識庫的 collection 名稱"
        )
        top_k: int = Field(
            default=5,
            description="返回的搜尋結果數量"
        )
        timeout: int = Field(
            default=30,
            description="API 請求超時時間（秒）"
        )

    def __init__(self):
        self.type = "pipe"
        self.id = "custom_rag_pipe"
        self.name = "Custom RAG Pipe"
        self.valves = self.Valves()

    def pipe(
        self,
        body: dict,
        __user__: Optional[dict] = None,
        __event_emitter__=None,
        __task__: Optional[str] = None,
    ) -> Union[Generator[str, None, None], str]:
        """
        主要處理函數 - 將請求轉送到 RAG API
        """
        # 取得使用者訊息
        messages = body.get("messages", [])
        user_message = self._get_last_user_message(messages)

        if not user_message:
            return "無法取得使用者訊息"

        # 發送狀態更新
        if __event_emitter__:
            __event_emitter__(
                {
                    "type": "status",
                    "data": {"description": "正在搜尋知識庫...", "done": False},
                }
            )

        try:
            # 呼叫 RAG API
            rag_response = self._call_rag_api(user_message)

            if __event_emitter__:
                __event_emitter__(
                    {
                        "type": "status",
                        "data": {"description": "搜尋完成", "done": True},
                    }
                )

            # 處理串流或非串流回應
            stream = body.get("stream", False)
            if stream:
                return self._stream_response(rag_response)
            else:
                return rag_response

        except Exception as e:
            error_msg = f"RAG API 錯誤: {str(e)}"
            if __event_emitter__:
                __event_emitter__(
                    {
                        "type": "status",
                        "data": {"description": error_msg, "done": True},
                    }
                )
            return error_msg

    def _get_last_user_message(self, messages: list) -> str:
        """取得最後一則使用者訊息"""
        for message in reversed(messages):
            if message.get("role") == "user":
                content = message.get("content", "")
                # 處理可能是 list 的 content（多模態訊息）
                if isinstance(content, list):
                    for item in content:
                        if isinstance(item, dict) and item.get("type") == "text":
                            return item.get("text", "")
                return content
        return ""

    def _call_rag_api(self, query: str) -> str:
        """
        呼叫自訂 RAG API
        """
        payload = {
            "query": query,
            "collection_name": self.valves.collection_name,
            "top_k": self.valves.top_k,
        }

        headers = {
            "Content-Type": "application/json",
        }

        response = requests.post(
            self.valves.rag_api_url,
            json=payload,
            headers=headers,
            timeout=self.valves.timeout,
        )

        response.raise_for_status()
        
        # 根據您的 RAG API 回應格式調整
        result = response.json()
        
        # 假設 API 回傳格式為 {"answer": "...", "sources": [...]}
        answer = result.get("answer", "")
        sources = result.get("sources", [])

        # 組合回應內容
        if sources:
            source_text = "\n\n**參考來源：**\n"
            for i, source in enumerate(sources, 1):
                source_text += f"{i}. {source.get('title', source.get('filename', 'Unknown'))}\n"
            return answer + source_text
        
        return answer

    def _stream_response(self, response: str) -> Generator[str, None, None]:
        """串流回應"""
        for char in response:
            yield char