f = File.open('alumnos.csv', 'r')
data = f.readlines
f.close
data = data.map{ |x| x.split(', ').map(&:chomp)}
def saludo
  puts "Escoja una de las cuatro opciones"
  puts "1 .- Promedio de alumnos"
  puts "2 .- Inacistencias totales"
  puts "3 .- Alumnos aprobados"
  puts "4 .- Salir del programa"
end
saludo
while search = gets.chomp.to_i
  case search
  when 1
File.open('promedios.txt', 'w') do |archivo|
    data.each do |i|
      promedio = i[1..5].map(&:to_f).sum / i[1..5].count
      puts promedio
    end
    archivo.puts "#{promedio}"
  end
  when 2
   data.each do |x|
      v = x[1..5].map(&:to_f).count(0)
      puts"#{v}"
    end
  when 3
    promedio = 0
    def aprobado(data, nota_minima = 5.0)
      data.each do |i|
        promedio =  i[1..5].map(&:to_f).sum / i[1..5].count
        if promedio <= nota_minima
          puts " el alumno #{data[0]} reprobo con promedio #{promedio}"
        else
          puts " el alumno #{data[0]} aprobó con #{promedio}"
        end
      end
    end
    aprobado(data, 5.0)
  when 4
    puts 'Adios'
    break
  end
end
