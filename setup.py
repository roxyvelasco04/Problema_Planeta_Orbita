from os import lseek


'''
Fichero de compilación, convierte el .pyx en un .so (Shared Object)
'''

from distutils.core import setup, Extension
from Cython.Build import cythonize

exts = (cythonize("POrbita_CY.pyx"))

setup(ext_modules = exts)