import data_wizard
from .models import *
from .serializers import *

data_wizard.register(Contract)
data_wizard.register('Multiple Contracts', ContractSerializer)