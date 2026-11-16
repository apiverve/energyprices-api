from setuptools import setup, find_packages

setup(
    name='apiverve_energyprices',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/energyprices?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
