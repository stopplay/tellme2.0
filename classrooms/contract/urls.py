from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views
from classrooms import settings

router = routers.DefaultRouter()
router.register(r'contracts', views.ContractsViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'contracts'
urlpatterns = [
    url('', include(router.urls)),
    path('mark_slm_purchased/<int:contract_id>', views.mark_slm_purchased, name="mark_slm_purchased"),
    url('createacontract/', views.createacontract, name="createacontract"),
    url('createacontract_rest/', views.createacontract_rest, name="createacontract_rest"),
    path('seecontractdetails/<int:contract_id>', views.seecontractdetails, name="seecontractdetails"),
    path('select_director_to_contract/<int:contract_id>', views.seecontractdetails, name="select_director_to_contract"),
    url('all/', views.seemycontracts, name="seemycontracts"),
    path('set_signed/<int:contract_id>', views.set_signed, name='set_signed'),
    path('set_signed_rest/<int:contract_id>', views.set_signed_rest, name='set_signed_rest'),
    path('updatecontract/<int:contract_id>', views.updatecontract, name='updatecontract'),
    path('delete_contract/<int:contract_id>', views.delete_contract, name='delete_contract'),
    path('seefinancialdetails/', views.seefinancialdetails, name='seefinancialdetails'),
    url('select_student_to_contract/', views.select_student_to_contract, name='select_student_to_contract'),
    path('select_student_to_contract_update/<int:contract_id>', views.select_student_to_contract_update, name='select_student_to_contract_update'),
    path(r'serve_protected/{}<path>/<int:contract_id>'.format(settings.MEDIA_URL[1:]), views.protected_serve, {'document_root': settings.MEDIA_ROOT}, name='serve_protected'),
    path('set_contract_paid/<int:contract_id>', views.set_contract_paid, name='set_contract_paid'),
]
