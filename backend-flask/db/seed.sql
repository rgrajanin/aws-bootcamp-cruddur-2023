-- this file was manually created
INSERT INTO public.users (display_name, handle,email, cognito_user_id)
VALUES
  ('Andrew Brown', 'andrewbrown','andrew@examprotest.com' ,'MOCK'),
  ('guru raghav', 'guru_raghav','guru_raghav1@outlook.com' ,'MOCK'),
  ('Andrew Bayko', 'bayko','bayko@examprotest.com' ,'MOCK'),
  ('Londo Mollari', 'londo','lmollari@centari.com' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'guru_raghav' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )