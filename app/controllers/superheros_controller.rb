class SuperherosController < ApplicationController

SUPER_IDS = ['1699','1440','2114','1441','1295','1420','1445','1457','1462','1320',
'1442','5010','1960','1456','1459','1460','4562','4444','3202','1940','5017','2112',
'1499','1475','1464','1260','8429','1455','1943','3182','1469','1345','1449',
'1467','3554','2497','2503','3534','1320','5047','1466','1478',
'1447','1505','7807','1456','1483','1256','1444','1802','1467','1473','1604','1699',
'14451','1807','1960','1702','1529','1686','1438','2357','1428','1686','1487',
'1698','1464','1696','1332','1697','2047','1446','1342','2475',
'1489','1332','1818','1254','1342','2475','1489','1332','1818','1254',
'1313','4885','1332','10448','2233','2149']

  def index
    # @superheros = Superhero.take(9)
    @superheros = Superhero.all.sample(9)
  end

  def show
    @superhero = Superhero.find(params[:id])
  end



  def create_superheros
    SUPER_IDS.each do |id|
      access(id)
    end
  end


  def access(id)
    params = SuperheroParameterParser.parse(Superhero.service.character(id))
    Superhero.create(params)
  end

end
