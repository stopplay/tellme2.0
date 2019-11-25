from django.db import models
from school_users.models import Student, Teacher, Head, Supervisor, Parent, Witness
from block.models import *
from contract.models import *

# Create your models here.
class School(models.Model):
	"""docstring for School"""
	school_id = models.AutoField(primary_key=True)
	school_name = models.TextField(verbose_name = 'Nome da escola')
	classes = models.ManyToManyField('Class')
	chains = models.ManyToManyField(Chain)
	heads = models.ManyToManyField(Head,verbose_name = 'Diretores')
	adminorsupervisor = models.ForeignKey(Supervisor, on_delete=models.SET_NULL, verbose_name = 'Admin/Supervisor', null=True, blank=True)
	adminorsupervisor_2 = models.ForeignKey(Supervisor, on_delete=models.SET_NULL, verbose_name = 'Admin/Supervisor_2', null=True, blank=True, related_name='adminorsupervisor_2')
	sponte_client_number = models.IntegerField(null=True, blank=True, verbose_name = 'SPONTE ID')
	sponte_token = models.TextField(null=True, blank=True, verbose_name = 'SPONTE Token')
	tell_me_school_id = models.IntegerField(null=True, blank=True, verbose_name = 'TellMe ID')
	country = models.TextField(null=True, blank=True, verbose_name = 'País')
	state = models.TextField(null=True, blank=True, verbose_name = 'Estado')
	city = models.TextField(null=True, blank=True, verbose_name = 'Cidade')
	quantity_of_directors = models.IntegerField(null=True, blank=True, default=1, verbose_name='Quantidade de Diretores')
	students = models.ManyToManyField(Student, blank=True, verbose_name = 'Estudantes')
	teachers = models.ManyToManyField(Teacher)
	parents = models.ManyToManyField(Parent)
	first_witness = models.ForeignKey(Witness, on_delete=models.SET_NULL, verbose_name = 'Primeira Testemunha', null=True, blank=True, related_name='first_witness_school')
	second_witness = models.ForeignKey(Witness, on_delete=models.SET_NULL, verbose_name = 'Segunda Testemunha', null=True, blank=True, related_name='second_witness_school')
	app_name = models.TextField(null=True, blank=True, verbose_name = 'Nome do App')
	is_maple_bear = models.BooleanField(default=False)
	value_per_contract = models.FloatField(default=0.00, null=True, blank=True, verbose_name = 'Valor por Contrato')

	@property
	def quantity_of_contracts_signed(self):
		count = 0
		for chain in self.chains.all():
			contracts = Contract.objects.filter(chain=chain)
			if contracts:
				for contract in contracts:
					if contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed and contract.all_signed:
						count+=1
		return count

	@property
	def quantity_of_contracts_total(self):
		count = 0
		for chain in self.chains.all():
			contracts = Contract.objects.filter(chain=chain)
			count+=contracts.count()
		return count

	@property
	def quantity_of_contracts_not_signed(self):
		count = 0
		for chain in self.chains.all():
			contracts = Contract.objects.filter(chain=chain)
			if contracts:
				for contract in contracts:
					if not (contract.first_auth_signed and contract.second_auth_signed and contract.counter_signed and contract.all_signed):
						count+=1
		return count
	
	
	@property
	def quantity_of_students_associated(self):
		return self.students.all().count()

	@property
	def quantity_of_parents_associated(self):
		count = 0
		parents = []
		for student in self.students.all():
			if student.first_parent and student.first_parent not in parents:
				parents += [(student.first_parent)]
				count+=1
			if student.second_parent and student.second_parent not in parents:
				parents += [(student.second_parent)]
				count+=1
		return count
	

	def __str__(self):
		return self.school_name

class Class(models.Model):
	"""docstring for Class"""
	class_id = models.AutoField(primary_key=True)
	class_name = models.TextField(verbose_name = 'Nome da turma')
	CLASS_UNIT_CHOICES = [('Integral', 'Integral'), ('Manhã','Manhã'), ('Tarde','Tarde'), ('Noite','Noite')]
	class_unit = models.CharField(max_length = 500, choices = CLASS_UNIT_CHOICES, default = 'Integral', null = True, verbose_name = 'Horário')
	enrollment_class_year = models.IntegerField(default=2019, verbose_name= 'Ano da turma')
	slm = models.TextField(null=True, blank=True, verbose_name = 'Materiais URL')
	sku = models.TextField(null=True, blank=True, verbose_name = 'SKU do Material')
	students = models.ManyToManyField(Student, blank=True, verbose_name = 'Estudantes')
	teachers = models.ManyToManyField(Teacher)
	def __str__(self):
		return self.class_name

	def preliminary_students(self):
		"""Remember to do this as well later, confirm student"""
		pass