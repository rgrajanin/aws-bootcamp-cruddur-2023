from datetime import datetime, timedelta, timezone
from opentelemetry import trace
import logging
from lib.db import db

tracer = trace.get_tracer("home.activities")

class HomeActivities:
  def run(cognito_user_id=None):        
    with tracer.start_as_current_span("home-activites-mock-data"):
      span = trace.get_current_span()      
      now = datetime.now(timezone.utc).astimezone()      
      span.set_attribute("app.now",now.isoformat())
     
    results = db.query_array_json("""
    SELECT
        activities.uuid,
        users.display_name,
        users.handle,
        activities.message,
        activities.replies_count,
        activities.reposts_count,
        activities.likes_count,
        activities.reply_to_activity_uuid,
        activities.expires_at,
        activities.created_at
      FROM public.activities
      LEFT JOIN public.users ON users.uuid = activities.user_uuid
      ORDER BY activities.created_at DESC
    """)
    if cognito_user_id != None:
      extra_crud = {
        'uuid': '0e880de1-e045-490e-9ed8-3647325ae288',
        'handle':  'Lore',
        'message': 'Hello , there is a problem',
        'created_at': (now - timedelta(hours=1)).isoformat(),
        'expires_at': (now + timedelta(hours=12)).isoformat(),
        'likes': 1042,
        'replies': []
      }
      results.insert(0,extra_crud)

    span.set_attribute("app.result_length", len(results))
    return results 