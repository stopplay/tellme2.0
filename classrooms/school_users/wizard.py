import data_wizard
from .models import *
from .serializers import *


data_wizard.register(Parent)
data_wizard.register('Multiple Parents', ParentSerializer)
data_wizard.register(Student)
data_wizard.register('Multiple Students', StudentSerializer)
data_wizard.register(Teacher)
data_wizard.register('Multiple Teachers', TeacherSerializer)
data_wizard.register(Head)
data_wizard.register('Multiple Heads', HeadSerializer)