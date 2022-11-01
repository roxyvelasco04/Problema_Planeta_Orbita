import POrbita_CY
import POrbita_PY
import time

steps=1000000
time_frame = 100

planet_cy = POrbita_CY.Planet()
planet_py = POrbita_PY.Planet()

init_time=time.time()
POrbita_PY.step_time(planet_py, time_frame, steps)
end_time=time.time()

time_python = end_time - init_time

init_time=time.time()
POrbita_CY.step_time(planet_cy, time_frame, steps)
end_time=time.time()

time_cython = end_time - init_time

print("Tiempo de ejecucion con Python: {}s\n".format(time_python))
print("Tiempo de ejcucion con Cython: {}s\n".format(time_cython))

print("Cython es {} veces más rápido que Python ".format(round(time_python/time_cython, 2)))
