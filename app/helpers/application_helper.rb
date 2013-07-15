module ApplicationHelper
	def he_or_she
		@victim = Victim.find(params[:id])
			if @victim.gender == 'female'
				return 'she'
			elsif @victim.gender == 'male'
				return 'he'
			else
				return 'this person'
			end
	end

	# He is the one who went to his house. It was him.
	# She is the one who went to her house. It was her.
	# This user is the one who went to 

	def him_or_her
		@victim = Victim.find(params[:id])
			if @victim.gender == 'female'
				return 'her'
			elsif @victim.gender == 'male'
				return 'him'
			else 
				return ''
			end
	end

end
