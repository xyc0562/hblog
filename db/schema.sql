CREATE TABLE Document
( 
  id serial,
  category text NOT NULL,
  title text NOT NULL,
  content text NOT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  CONSTRAINT document_pk PRIMARY KEY (id)
);

CREATE TABLE "User"
( 
  id serial,
  name text NOT NULL,
  username text NOT NULL,
  password_hash text NOT NULL,
  CONSTRAINT user_pk PRIMARY KEY (id)
);
