from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views

router = routers.DefaultRouter()
router.register(r'schools', views.SchoolsViewSet)


# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'school'
urlpatterns = [
    url('', include(router.urls)),
    path('seeclassbyid/<int:class_id>', views.seeclassbyid, name="seeclassbyid"),
    path('seechainbyid/<int:chain_id>', views.seechainbyid, name="seechainbyid"),
    url('add_school/', views.create_school, name="add_school"),
    url('seeallschools/', views.seeallschools, name="seeallschools"),
    path('seeschooldetails/<int:school_id>', views.seeschooldetails, name="seeschooldetails"),
    url('seeallschools_rest/', views.seeallschools_rest),
    path('update_school/<int:school_id>', views.update_school, name='update_school'),
    path('update_school_rest/<int:school_id>', views.update_school_rest, name='update_school_rest'),
    path('delete_school/<int:school_id>', views.delete_school, name='delete_school'),
    path('delete_school_rest/<int:school_id>', views.delete_school_rest, name='delete_school_rest'),
    path('add_class/<int:school_id>', views.add_class, name='add_class'),
    path('add_students_to_school/<int:school_id>', views.add_students_to_school, name='add_students_to_school'),
    path('add_teachers_to_school/<int:school_id>', views.add_teachers_to_school, name='add_teachers_to_school'),
    path('add_teachers_to_class/<int:class_id>', views.add_teachers_to_class, name='add_teacher_to_class'),
    path('add_students_to_class/<int:class_id>', views.add_students_to_class, name='add_student_to_class'),
    path('add_class_rest/<int:school_id>', views.add_class_rest, name='add_class_rest'),
    path('update_class/<int:class_id>', views.update_class, name='update_class'),
    path('verifyvalidchain/<int:class_id>', views.verifyvalidchain, name='verifyvalidchain'),
    path('delete_class/<int:class_id>', views.delete_class, name='delete_class'),
    url('create_block/', views.create_block, name='create_block'),

]
