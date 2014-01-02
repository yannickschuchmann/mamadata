var selectWithOtherField = {
	init: function() {
		$('.selectWithOtherField').each(function(module) {
			var $this = $(this),
				$select = $this.find('select'),
				$input = $this.find('input'),
				inputVal = $input.val(),
				$otherSelected = true;

			$select.find('option').each(function(option) {
				if($(this).val() === inputVal) {
					$otherSelected = false;
				}
			});

			if(inputVal !== '' && $otherSelected) {
				$this.find('select option[value="Other"]').prop('selected', true);
				$input.prop('disabled', false);
			}else{
				$input.val('');
			}
		});
		$('.selectWithOtherField select').on('blur change', function(e) {
			var $this = $(this),
				val = $this.val();
			if(val === 'Other') {
				$this.closest('.selectWithOtherField').find('input').prop('disabled', false).focus();
			}else{
				$this.closest('.selectWithOtherField').find('input').prop('disabled', true);
			}
		});
	}
};

$(document).ready(function() {
	selectWithOtherField.init();
});
