from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker


#create engine
database_url = 'postgresql://user:password@localhost:5432/mydatabase'
engine = create_engine(database_url)

Base = declarative_base()


#model-> define how data is stored in the database
class Student(Base):
    __tablename__ = 'students'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    age = Column(Integer)


#Session
Session = sessionmaker(bind=engine)
session = Session()

# insert data
student = Student(name='Nisha', age=22)
session.add(student)
session.commit()


