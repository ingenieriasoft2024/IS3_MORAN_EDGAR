-- Crear la tabla de Dependencias
CREATE TABLE Dependencias (
    dependencia_id SERIAL PRIMARY KEY,
    dependencia_nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla de Operaciones
CREATE TABLE Operaciones (
    operaciones_id SERIAL PRIMARY KEY,
    operaciones_fecha DATE NOT NULL,
    operaciones_origen VARCHAR(200) NOT NULL,
    operaciones_destino VARCHAR(200) NOT NULL,
    operaciones_estado VARCHAR(50) NOT NULL,
    operaciones_dep_id INT,
    FOREIGN KEY (operaciones_dep_id) REFERENCES Dependencias(dependencia_id)
);

-- Crear la tabla de Coordenadas
CREATE TABLE Coordenadas (
    coordenadas_id SERIAL PRIMARY KEY,
    coordenadas_ope_id INT,
    coordenadas_latitud DECIMAL(10, 7) NOT NULL,
    coordenadas_longitud DECIMAL(10, 7) NOT NULL,
    FOREIGN KEY (coordenadas_ope_id) REFERENCES Operaciones(operaciones_id)
);

-- Crear la tabla de Roles
CREATE TABLE Roles (
    rol_id SERIAL PRIMARY KEY,
    rol_nombre VARCHAR(50) NOT NULL,
    rol_descripcion TEXT,
    rol_situacion SMALLINT DEFAULT 1
);

-- Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    usu_id SERIAL PRIMARY KEY,
    usu_nombre VARCHAR(50) NOT NULL,
    usu_password VARCHAR(255) NOT NULL,
    usu_rol_id INT NOT NULL,
    usu_dep_id INT,  -- Puede ser NULL si el usuario no está asociado a ninguna dependencia
    usu_situacion SMALLINT DEFAULT 1,
    FOREIGN KEY (usu_rol_id) REFERENCES Roles(rol_id),
    FOREIGN KEY (usu_dep_id) REFERENCES Dependencias(dependencia_id)
);

-- Crear la tabla de Permisos
CREATE TABLE Permisos (
    permiso_id SERIAL PRIMARY KEY,
    permiso_rol INT NOT NULL,
    permiso_tipo VARCHAR(50) NOT NULL,
    permiso_situacion SMALLINT DEFAULT 1,
    FOREIGN KEY (permiso_rol) REFERENCES Roles(rol_id)
);



INSERT INTO Dependencias (dependencia_nombre) VALUES ('Primera Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Segunda Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Tercera Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Cuarta Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Quinta Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Sexta Brigada de Infanteria');
INSERT INTO Dependencias (dependencia_nombre) VALUES ('Septima Brigada de Infanteria');

INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-01', 'Flores Peten', 'Elevacion 3000', 'Activo', 1);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-02', 'Destacamento Militar de Raxuhá', 'Finca Los Amates', 'Desarrollo', 2);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-03', 'Fray Bartolome de las Casas', 'Rio Chixoy', 'Activo', 3);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-04', 'Aldea Chirijox', 'Aldea el Mirador', 'Desarollo', 4);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-05', 'Finca Los Arollos', 'Aldea Margaritas', 'Activo', 5);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-06', 'Aldea Semuy 2', 'Aldea Semuy 1', 'Planificacion', 6);
INSERT INTO Operaciones (operaciones_fecha, operaciones_origen, operaciones_destino, operaciones_estado, operaciones_dep_id) 
VALUES ('2024-01-07', 'Aldea Semuy 1', 'Aldea Las Perlas', 'Planificacion', 7);

INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (1, 14.2788902,-89.9167455);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (2, 15.4666694,-90.4050866);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (3, 15.9900421,-90.7917026);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (4, 16.9103153,-89.908656);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (5, 14.8523112,-91.5940047);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (6, 15.5318012,-89.3406594);
INSERT INTO Coordenadas (coordenadas_ope_id, coordenadas_latitud, coordenadas_longitud) 
VALUES (7, 14.2788902,-89.9167455);












