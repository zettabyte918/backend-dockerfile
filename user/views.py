from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

class ReturnMessage(APIView):

    def get(self, request: Request):
        response = {"message": "Hello world, from django drf app on docker!."}
        return Response(response, status=status.HTTP_200_OK)