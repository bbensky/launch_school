DEFAULT_STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet
                      Ileana Joseph Kincaid Larry].freeze
PLANTS_INITIALS = { clover: 'C', grass: 'G', radishes: 'R',
                    violets: 'V' }.freeze

class Garden
  attr_reader :students, :plant_rows, :students_and_plants, :student_indices

  def initialize(diagram, students = DEFAULT_STUDENTS)
    @students            = students.sort
    @student_indices     = generate_student_indices
    @plant_rows          = generate_plant_rows(diagram)
    @students_and_plants = student_plant_hash
    generate_singleton_methods
  end

  private

  def generate_singleton_methods
    students.each do |student|
      define_singleton_method(student.downcase.to_sym) do
        students_and_plants[student]
      end
    end
  end

  def generate_student_indices
    result = {}
    all_indices = []
    current_indices = []

    0.upto((@students.size * 2) - 1) do |index|
      current_indices << index
      next unless index.odd?
      all_indices << current_indices
      current_indices = []
    end

    students.each_with_index { |stud, idx| result[stud] = all_indices[idx] }

    result
  end

  def student_plant_hash
    result = generate_student_plant_hash

    plant_rows.each do |row|
      row.each_with_index do |plant, idx|
        student_indices.each do |student, indices|
          result[student] << PLANTS_INITIALS.key(plant) if indices.include?(idx)
        end
      end
    end

    result
  end

  def generate_student_plant_hash
    result = Hash.new(0)
    students.each { |student| result[student] = [] }
    result
  end

  def generate_plant_rows(diagram)
    rows = diagram.split("\n")
    rows.map { |row| row.split('') }
  end
end
