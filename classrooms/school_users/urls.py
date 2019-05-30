from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

# router = routers.DefaultRouter()
# router.register(r'schools', views.SchoolsViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'users'
urlpatterns = [
    # url('', include(router.urls)),
    url('create_user/', views.create_user, name="create_user"),
    url('seeallusers/', views.seeallusers, name="seeallusers"),
    url('seeallusers_rest/', views.seeallusers_rest),
    path('delete_user/<int:user_id>/<type_of_user>', views.delete_user, name='delete_user'),
    path('set_parents/<int:student_id>/', views.set_parents, name='set_parents'),
    url('login/', views.do_login, name='login'),
    url('api/login', obtain_jwt_token, name='login_rest'),
    url('current_user/', views.current_user, name='current_user'),

]
