# Generated by Django 3.1 on 2020-12-12 20:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0009_accountbook'),
    ]

    operations = [
        migrations.AddField(
            model_name='plan_module',
            name='accountBookKey',
            field=models.ForeignKey(default=1, null=True, on_delete=django.db.models.deletion.SET_NULL, to='web.accountbook'),
        ),
    ]
