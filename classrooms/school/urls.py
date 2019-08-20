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
    url('import_xml/', views.import_xml, name='import_xml'),
    url('import_sponte/', views.import_sponte, name='import_sponte'),
    path('seeclassbyid/<int:class_id>', views.seeclassbyid, name="seeclassbyid"),
    path('blockchain/<int:chain_id>', views.seechainbyid, name="seechainbyid"),
    url('add_school/', views.create_school, name="add_school"),
    url('seeallschools/', views.seeallschools, name="seeallschools"),
    path('seeschooldetails/<int:school_id>', views.seeschooldetails, name="seeschooldetails"),
    url('seeallschools_rest/', views.seeallschools_rest),
    path('update_school/<int:school_id>', views.update_school, name='update_school'),
    path('update_school_rest/<int:school_id>', views.update_school_rest, name='update_school_rest'),
    path('delete_school/<int:school_id>', views.delete_school, name='delete_school'),
    path('delete_school_rest/<int:school_id>', views.delete_school_rest, name='delete_school_rest'),
    path('<int:school_id>/add_class', views.add_class, name='add_class'),
    path('<int:school_id>/add_another_class', views.add_another_class, name='add_another_class'),
    path('<int:school_id>/add_another_class/add_students_for_multiple_classes', views.add_students_for_multiple_classes, name='add_students_for_multiple_classes'),
    path('<int:school_id>/add_another_class/select_class_to_add_students', views.select_class_to_add_students, name='select_class_to_add_students'),
    path('<int:school_id>/add_another_class/<int:class_id>/add_multiple_students', views.add_multple_students_for_class_and_school, name='add_multple_students_for_class_and_school'),
    path('<int:school_id>/add_first_witness', views.add_first_witness, name='add_first_witness'),
    path('<int:school_id>/add_second_witness', views.add_second_witness, name='add_second_witness'),
    path('<int:school_id>/add_witness/<type_of_user>', views.add_witness, name='add_witness'),
    path('<int:school_id>/set_witnesses', views.set_witnesses, name='set_witnesses'),
    path('<int:school_id>/add_class/<int:class_id>/add_student', views.add_student_to_class_and_school, name='add_student_to_class_and_school'),
    path('<int:school_id>/add_class/<int:class_id>/add_multiple_students', views.add_students_to_class_and_school, name='add_students_to_class_and_school'),
    path('<int:school_id>/add_class/<int:class_id>/add_student/<int:student_id>/add_first_parent_to_student', views.add_first_parent_to_student, name='add_first_parent_to_student'),
    path('<int:school_id>/add_class/<int:class_id>/add_student/<int:student_id>/add_second_parent_to_student', views.add_second_parent_to_student, name='add_second_parent_to_student'),
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
