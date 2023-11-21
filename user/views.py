from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

class ReturnMessage(APIView):

    def get(self, request: Request):
        return Response({"message": "Hello world, from django drf app on docker!."}, status=status.HTTP_400_BAD_REQUEST)