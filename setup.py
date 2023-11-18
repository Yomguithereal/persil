from setuptools import setup, find_packages

with open("./README.md", "r") as f:
    long_description = f.read()

setup(
    name="persil",
    version="0.0.1",
    description="Threadsafe & persistent python collections relying on SQLite.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="http://github.com/Yomguithereal/persil",
    license="MIT",
    author="Guillaume Plique",
    author_email="kropotkinepiotr@gmail.com",
    keywords="sqlite",
    python_requires=">=3.7",
    packages=find_packages(exclude=["bench", "test"]),
    package_data={"docs": ["README.md"]},
    install_requires=[],
    zip_safe=True,
)
