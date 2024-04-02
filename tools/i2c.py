from pyBusPirateLite.I2C import I2C

class I2CDevice:
  def __init__(self, address):
      self.i2c = I2C()
      self.i2c.enter()
      self.i2c.speed = '400kHz'
      self.i2c.configure(pullup=True)
      self.read_address = address << 1 | 1
      self.write_address = address << 1

  def read_register(self, address):
      assert address >= 0 and address < 256
      self.i2c.write_then_read(2, 0, [self.write_address, address])
      bytes = self.i2c.write_then_read(1, 1, [self.read_address])
      return int.from_bytes(bytes, byteorder='big')

  def write_register(self, address, value):
      assert address >= 0 and address < 256
      combined = [self.write_address, address] + list(value.to_bytes(1, byteorder='big'))
      self.i2c.write_then_read(len(combined), 0, combined)
