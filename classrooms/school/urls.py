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
    url('add_school/', views.create_school, name="add_school"),
    url('seeallschools/', views.seeallschools, name="seeallschools"),
    url('seeallschools_rest/', views.seeallschools_rest),
    path('update_school/<int:school_id>', views.update_school, name='update_school'),
    path('delete_school/<int:school_id>', views.delete_school, name='delete_school'),
    path('add_class/<int:school_id>', views.add_class, name='add_class'),
    path('update_class/<int:class_id>', views.update_class, name='update_class'),
    path('verifyvalidchain/<int:class_id>', views.verifyvalidchain, name='verifyvalidchain'),
    path('delete_class/<int:class_id>', views.delete_class, name='delete_class'),
    url('create_block/', views.create_block, name='create_block'),
]
