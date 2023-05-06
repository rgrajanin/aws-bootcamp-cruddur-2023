-- this file was manually created
INSERT INTO public.users (display_name, handle,email, cognito_user_id)
VALUES
  ('Andrew Brown', 'andrewbrown','gururajan.raghavendran1+andrew@gmail.com' ,'MOCK'),
  ('guru raghav', 'guru_raghav','gururajan.raghavendran1@gmail.com' ,'MOCK'),
  ('Andrew Bayko', 'bayko','gururajan.raghavendran1+bayco@gmail.com' ,'MOCK'),
  ('Londo Mollari', 'londo','gururajan.raghavendran1+londo@gmail.com' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
   selec (SELECT uuid from public.users WHERE users.handle = 'guru_raghav' LIMIT 20),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )