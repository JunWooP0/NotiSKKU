from django.urls import path
from . import views

urlpatterns = [
    path('notices/', views.notice_list, name='notice_list'),
]
