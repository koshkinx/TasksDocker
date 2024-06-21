from celery import shared_task
from .models import Message
import logging

logger = logging.getLogger(__name__)


@shared_task
def log_last_10_messages():
    messages = Message.objects.order_by('-timestamp')[:10]
    for message in messages:
        logger.info(message.content)
