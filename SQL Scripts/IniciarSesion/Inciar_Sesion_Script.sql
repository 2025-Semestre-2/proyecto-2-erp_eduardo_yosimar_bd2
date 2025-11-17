
-- Agregar el use a las base de datos que ya estan en ejecucion

CREATE VIEW vw_Usuarios
AS
SELECT 
    iduser,
    username,
    fullname,
    active,
    rol,
    email,
    hiredate,
    sucursal
FROM dbo.Usuarios;
GO


-- SP para validar si los datos ingresados para el inicio de sesion son validos.
CREATE PROCEDURE sp_ValidarUsuario
  @Email VARCHAR(100),
  @Password VARCHAR(255)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT iduser, username, fullname, rol, sucursal
  FROM Usuarios
  WHERE email = @Email
    AND password_hash = CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', @Password))
    AND active = 1;
END;
GO
