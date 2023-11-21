from django.urls import path
from views import ReturnMessage


urlpatterns = [
    path("get-message/", ReturnMessage.as_view(), name="message"),
]