# Generated by Django 3.1 on 2020-12-12 15:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0006_docsort'),
    ]

    operations = [
        migrations.AddField(
            model_name='filemodifyrecord',
            name='docSortKey',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='web.docsort'),
        ),
    ]