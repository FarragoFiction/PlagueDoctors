# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

karkat = '{\"lastPlayed\":\"1542840462569\",\"isempress\":\"false\",\"hatchDate\":\"1542840462569\",\"lastFed\":\"1542840462569\",\"dollDATAURL\":\"Karkat Vantas:___HBRpaWn_AADuAABpaWmZmZmJiYn_uin_uikAAAAAAABLS0s6OjoREREAAAAREREzMzPExMT_AAB_AAAIgrBWN_4eDwWC2A==\",\"boredomJson\":\"0\",\"nameJSON\":\"Karkat Vantas\",\"healthJson\":\"100\",\"TYPE\":\"GRUB\",\"corrupt\":\"false\",\"purified\":\"false\",\"patience\":\"0\",\"idealistic\":\"0\",\"curious\":\"0\",\"loyal\":\"113\",\"energetic\":\"0\",\"external\":\"0\",\"remembered\":\"{}\",\"rememberedNames\":\"{}\",\"rememberedCastes\":\"{}\"}","breeder":"ParadoxSpace'
feferi = '{\"lastPlayed\":\"1542843765974\",\"isempress\":\"false\",\"hatchDate\":\"1542843765974\",\"lastFed\":\"1542843765974\",\"dollDATAURL\":\" Feferi Peixes:___HBSZAE2xEmL_qeUA-lEEsj7_qeX_uin_uimZAE0AAAAA3v43qskREREuLi6xEmKZAE3ExMSZAE13ACsIgsBYOgqEBQKcJhQKAkBJgA==\",\"boredomJson\":\"0\",\"nameJSON\":\" Feferi Peixes\",\"healthJson\":\"100\",\"TYPE\":\"GRUB\",\"corrupt\":\"false\",\"purified\":\"false\",\"patience\":\"0\",\"idealistic\":\"0\",\"curious\":\"0\",\"loyal\":\"0\",\"energetic\":\"113\",\"external\":\"0\",\"remembered\":\"{}\",\"rememberedNames\":\"{}\",\"rememberedCastes\":\"{}\"}","breeder":"ParadoxSpace"}'
terezi = '{\"lastPlayed\":\"1542843765974\",\"isempress\":\"false\",\"hatchDate\":\"1542843765974\",\"lastFed\":\"1542843765974\",\"dollDATAURL\":\"Terezi Pyrope:___YU8QAAAIKCAGBgAIKCAGBgAEBA8QAA8QAAAIKCAAAAAAAASkpKERERSkpK8QAApAYIxMTEAIKCAGBgCILwXgmFg-_ASQsWAogFFg",\"boredomJson\":\"0\",\"nameJSON\":\" Terezi Pyrope\",\"healthJson\":\"100\",\"TYPE\":\"GRUB\",\"corrupt\":\"false\",\"purified\":\"false\",\"patience\":\"0\",\"idealistic\":\"0\",\"curious\":\"0\",\"loyal\":\"0\",\"energetic\":\"0\",\"external\":\"113\",\"remembered\":\"{}\",\"rememberedNames\":\"{}\",\"rememberedCastes\":\"{}\"}","breeder":"ParadoxSpace"}'

permanents = [karkat,feferi,terezi]

#TimeHole.create(permanent: true , wigglerJSON: '')

#keeps it from remaking seeds already in the system
permanents.each do |x|
  if(!TimeHole.exists?(wigglerJson: x))
    TimeHole.create(permanent: true , wigglerJSON: x)
  end
end


