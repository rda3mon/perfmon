try:
    from setuptools import setup
    from setuptools import find_packages
    has_setup_tools = true
except ImportError:
    from distutils.core import setup
    has_setup_tools = false

with open("README.md", "r") as fh:
    long_description = fh.read()

if has_setup_tools is True:
    packages = setuptools.find_packages()
else:
    packages = ["perfmon"]

setup(
    name="perfmon",
    version="__version",
    description="linux process performance monitoring tool",
    long_description=long_description,
    url="https://github.com/rda3mon/perfmon",
    author="rda3mon",
    author_email="mallikvarjun@gmail.com",
    license="Apache License 2.0",
    packages=["perfmon"],
    classifiers=[
        'Topic :: monitoring :: linux :: performance',
        'Development Status :: 2 - Experimental/Unstable',
        'Environment :: Console',
        'License :: Apache License 2.0',
        'Programming Language :: Python :: 2.7',
        "Operating System :: OS Independent"
    ]
)


