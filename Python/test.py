from pyflink.table import DataTypes
from pyflink.table.udf import udf


@udf(input_types=[DataTypes.STRING()], result_type=DataTypes.STRING())
def func1(s: str):
   return s.replace('buy', 'sold')#把字符串中的buy替换为sold