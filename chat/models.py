from django.db import models

class Message(models.Model):
    user = models.CharField(max_length=50)
    message = models.CharField(max_length=200)
    timestamp = models.DateField()
    
    def __str__(self):
        return self.message