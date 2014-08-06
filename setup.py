from setuptools import setup, find_packages

# REDI
# 
# Egg file can be generated by running below commands from project root
# 
# make clean 
# make egg
#
# Can be installed from the .egg file as shown below
#   sudo easy_install REDI-<Version_number>.egg 
#   
# Note: the OS needs to have 
#   apt-get install setuptools python-dev libxml2 libxslt1-dev

setup(
    name='REDI',
    version='0.10.0',
    author='Christopher P Barnes, Philip Chase, Nicholas Rejack',
    author_email='cpb@ufl.edu, pbc@ufl.edu, nrejack@ufl.edu',
    packages=find_packages(exclude=['test']),
    include_package_data=True,
    package_data = {
        'bin'   : ['utils/*.xsl', 'utils/*.xsd'],
        'redi'  : ['README.md'],
        'db'    : ['Makefile']
    },
    url='http://it.ctsi.ufl.edu/about/',
    license='BSD 3-Clause',
    description='REDCap Electronic Data Importer',
    long_description=open('README.md').read(),
    install_requires = [
        "requests >= 2.2.1",
        "lxml >= 3.3.5",
        "PyCap",
        "pysftp",
        "appdirs"
    ],
    entry_points={
            'console_scripts': [
                'redi = bin.redi:main',
                ],
            },
    test_suite='test'
)
