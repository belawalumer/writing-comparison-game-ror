task assign_points: :environment do 
    min_score = 0
    #extracting as per the lenght of essay's content

    top_essays = Script.order(:content).last(3)
    top_essays.each do |essay|
        min_score +=5
        essay.point.update!(value: min_score) 
    end
end