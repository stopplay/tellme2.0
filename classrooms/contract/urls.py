from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views

router = routers.DefaultRouter()
router.register(r'contracts', views.ContractsViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'contracts'
urlpatterns = [
    url('', include(router.urls)),
    url('createacontract/', views.createacontract, name="createacontract"),
    path('seecontractdetails/<int:contract_id>', views.seecontractdetails, name="seecontractdetails"),
    url('seemycontracts/', views.seemycontracts, name="seemycontracts"),
    path('set_signed/<int:contract_id>', views.set_signed, name='set_signed'),
    path('updatecontract/<int:contract_id>', views.updatecontract, name='updatecontract'),
    path('delete_contract/<int:contract_id>', views.delete_contract, name='delete_contract'),
]
