from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views

router = routers.DefaultRouter()
router.register(r'chains', views.ChainViewSet)

urlpatterns = [
	url('', include(router.urls)),
    url(r'^blocks/(?P<chain_name>[A-Za-z0-9-]+)/latest$', views.LatestBlockApiView.as_view(), name='latest-block'),
    url(r'^blocks/(?P<chain_name>[A-Za-z0-9-]+)/mine-block$', views.BlockCreateView.as_view(), name='mine-block'),
    url(r'^blocks/(?P<hash>[A-Za-z0-9-]+)$', views.BlockApiView.as_view(), name='get'),
    url(r'^chains/(?P<name>[A-Za-z0-9-]+)$', views.ChainApiView.as_view(), name='chain'),
    url(r'^peers/$', views.PeerApiView.as_view(), name='peers'),
    url(r'^peers/add$', views.PeerApiView.as_view(), name='add-peer'),
    url(r'^transaction/$', views.TransactionsList.as_view(), name='transaction'),
]