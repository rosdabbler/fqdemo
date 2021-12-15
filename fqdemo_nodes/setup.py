from setuptools import setup

package_name = 'fqdemo_nodes'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='R. Kent James',
    maintainer_email='kent@caspia.com',
    description='Full quality demo template',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'pytalker = fqdemo_nodes.PySubPub:main',
        ],
    },
)
