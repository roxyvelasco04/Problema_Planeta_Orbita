from math import sqrt

class Planet(object):

    def __init__(self):
        #Posición y velocidad inicial
        self.x = 1.0
        self.y = 0.0
        self.z = 0.0
        self.vx = 0.0
        self.vy = 0.5
        self.vz = 0.0

        self.m = 1.0

def single_step(planet, dt):
    """Single step"""

    #Calcular la fuerza
    cdef double distance = sqrt(planet.x**2 + planet.y**2 + planet.z**2)
    cdef double Fx = -planet.x / distance**3
    cdef double Fy = -planet.y / distance**3
    cdef double Fz = -planet.z / distance**3

    #Posición de cada iteración
    planet.x += dt * planet.vx
    planet.y += dt * planet.vy
    planet.z += dt * planet.vz

    #Velocidad de cada iteración
    planet.vx += dt * Fx / planet.m
    planet.vy += dt * Fy / planet.m
    planet.vz += dt * Fz / planet.m
 
def step_time(planet, time_span, n_steps):
    """Makes a number of steps"""
    cdef double dt = time_span / n_steps
    cdef int j
    for j in range(n_steps):
        single_step(planet, dt)
