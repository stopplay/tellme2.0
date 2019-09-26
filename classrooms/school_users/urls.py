from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
from django.contrib.auth.views import PasswordResetView

# router = routers.DefaultRouter()
# router.register(r'schools', views.SchoolsViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'users'
urlpatterns = [
    # url('', include(router.urls)),
    url('create_user/', views.create_user, name="create_user"),
    url('all/', views.seeusersbyquery, name="seeallusers"),
    path('all_by_school/<int:school_id>', views.seeallusers_by_school, name='seeallusers_by_school'),
    url('all_rest/', views.seeallusers_rest),
    path('delete_user/<int:user_id>/<type_of_user>', views.delete_user, name='delete_user'),
    path('set_parents/<int:student_id>/', views.set_parents, name='set_parents'),
    path('add_parent/<int:student_id>/<type_of_user>', views.add_parent, name='add_parent'),
    path('add_first_parent/<int:student_id>', views.add_first_parent, name='add_first_parent'),
    path('add_second_parent/<int:student_id>', views.add_second_parent, name='add_second_parent'),
    path('classes/ajax', views.classes_choices_ajax, name='classes_choices_ajax'),
    url('add_student/', views.add_student, name='add_student'),
    url('login/', views.do_login, name='login'),
    path('login_from_other_system/<username>', views.login_from_other_system, name='login_from_other_system'),
    url('logout', views.do_logout, name='logout'),
    url('api/login', obtain_jwt_token, name='login_rest'),
    url('api/refresh_token', refresh_jwt_token, name='refresh_token'),
    url('current_user/', views.current_user, name='current_user'),
    path('create_head_to_school/<int:school_id>', views.create_head_to_school, name='create_head_to_school'),
    path('create_supervisor_to_school/<int:school_id>', views.create_supervisor_to_school, name='create_supervisor_to_school'),
    url(r'^reset_password/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$', views.reset_password, name='reset_password'),
    url('generate_password', views.generate_password, name='generate_password'),
    url('profile', views.profile, name='profile'),
    path('do_u_need_parents/<int:student_id>/<int:school_id>/<int:class_id>', views.do_u_need_parents, name='do_u_need_parents'),
    path('seesonsofparent/<int:parent_id>', views.seesonsofparent, name='seesonsofparent'),
    path('reset_password_send_email/<int:user_id>/<type_of_user>', views.reset_password_send_email, name='reset_password_send_email'),

]
