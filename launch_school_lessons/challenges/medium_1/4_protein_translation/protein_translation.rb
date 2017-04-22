require 'pry'

PROTEIN_TO_CODONS = { 'Methionine'    => ['AUG'], 
                      'Phenylalanine' => ['UUU', 'UUC'],
                      'Leucine'       => ['UUA', 'UUG'],
                      'Serine'        => ['UCU', 'UCC', 'UCA', 'UCG'],
                      'Tyrosine'      => ['UAU', 'UAC'],
                      'Cysteine'      => ['UGU', 'UGC'],
                      'Tryptophan'    => ['UGG'],
                      'STOP'          => ['UAA', 'UAG', 'UGA'] }

class InvalidCodonError < RuntimeError; end

# class Translation
#   def self.of_codon(codon)
#     PROTEIN_TO_CODONS.each do |protein, codons|
#       return protein if codons.include?(codon)
#     end
#     raise InvalidCodonError
#   end

#   def self.of_rna(strand)
#     codons = separate_codons(strand)
#     proteins = []

#     codons.each do |codon|
#       protein = of_codon(codon)
#       break if protein == 'STOP'
#       proteins << of_codon(codon)
#     end

#     proteins
#   end

#   private

#   def self.separate_codons(strand)
#     codons = []
#     number_of_codons = strand.length / 3
    
#     number_of_codons.times do 
#       str = ''
#       3.times { str << strand.slice!(0) }
#       codons << str
#     end
#     codons
#   end
# end

class Translation
  def self.of_codon(codon)
    PROTEIN_TO_CODONS.each do |protein, codons|
      return protein if codons.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna (strand)
    codons = strand.scan(/.../)
    proteins = codons.map { |codon| of_codon(codon) }
    proteins.take_while { |protein| protein != 'STOP' }
  end
end

strand = 'AUGUUUUAA'
p Translation.of_rna(strand)

