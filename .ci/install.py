import subprocess
import sys

from pkg_resources import parse_requirements

print(subprocess.check_output([sys.executable, '-m', 'pip', 'install', '-U', 'pip',
                              '--isolated']).decode())
print(subprocess.check_output([sys.executable, '-m', 'pip', 'install', 'keyring', '--isolated']).decode())
print(subprocess.check_output([sys.executable, '-m', 'pip', 'install', 'artifacts-keyring',
                              '--isolated']).decode())

for pkg in sys.argv[1:]:

    if 'requirements.txt' in pkg:
        with open('requirements.txt') as f:
            for req in parse_requirements(f.read()):
                print(subprocess.check_output([sys.executable,
                                              '-m', 'pip', 'install', str(req)]).decode())
    else:
        print(subprocess.check_output([sys.executable, '-m', 'pip', 'install', pkg]).decode())