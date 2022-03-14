import subprocess

PACKAGE_NAME = "bowdata.test.flask."

def process(package_name=PACKAGE_NAME):
    installed = subprocess.check_output(['pip', 'freeze', '--exclude-editable', '--all']).decode().splitlines()

    frozen_requirements = [u for u in installed if package_name not in u]
    with open('frozen_requirements.txt', 'w') as f:
        f.write('\n'.join(frozen_requirements))


if __name__ == "__main__":
    process()