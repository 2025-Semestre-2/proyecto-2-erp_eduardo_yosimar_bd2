-- >> Registrar los usuarios del corporativo.

USE WWI_Corporativo_V1;
GO

-- Eduardo
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'eduardo',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'eduardo123')),
  'Eduardo García',
  'Administrador',
  'eduardo@example.com',
  'Corporativo'
);

-- Yosimar
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'yosimar',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'yosimar123')),
  'Yosimar Montenegro',
  'Administrador',
  'yosimar@WWI.com',
  'Corporativo'
);


-- Invitado
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'invitado',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'invitado123')),
  'Invitado corporativo',
  'Corporativo',
  'invitado@WWI.com',
  'Corporativo'
);

-- >> Registrar los usuarios de Limon
USE WWI_Limon_V1;
GO

-- Eduardo
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'eduardo',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'eduardo123')),
  'Eduardo García',
  'Administrador',
  'eduardo@example.com',
  'Limon'
);

-- Yosimar
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'yosimar',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'yosimar123')),
  'Yosimar Montenegro',
  'Administrador',
  'yosimar@WWI.com',
  'Limon'
);


-- Invitado
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'invitado',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'invitado123')),
  'Invitado corporativo',
  'Corporativo',
  'invitado@WWI.com',
  'Limon'
);


-- >> Registrar los usuarios de San jose.
USE WWI_San_Jose_V1;
GO

-- Eduardo
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'eduardo',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'eduardo123')),
  'Eduardo García',
  'Administrador',
  'eduardo@example.com',
  'SanJose'
);

-- Yosimar
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'yosimar',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'yosimar123')),
  'Yosimar Montenegro',
  'Administrador',
  'yosimar@WWI.com',
  'SanJose'
);


-- Invitado
INSERT INTO Usuarios (username, password_hash, fullname, rol, email, sucursal)
VALUES (
  'invitado',
  CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', 'invitado123')),
  'Invitado corporativo',
  'Corporativo',
  'invitado@WWI.com',
  'SanJose'
);