<script>
</script>

<section>
	<div class="main">
		<p>keep dancing</p>
	</div>	
</section>

<style>
	section {
		padding: 0 0;
		height: 100%;
		width: 100%;

		display: flex;
		flex-flow: column nowrap;
		justify-content: center;

		align-items: center;
		text-align: center;

		/* background: var(--primary-50); */
		overflow: auto;
		z-index: 1;

		user-select: none;
		pointer-events: none;
	}


	.main {
		max-width: 800px;
		min-width: 270px;

		display: flex;
		flex-flow: column nowrap;
		justify-content: center;
		gap: 10px;

		color: var(--background);
		border: solid 1px var(--primary);
		padding:  20px;
	}

	.main p {
		padding: 10px;
		/* background:  var(--background); */
		color: var(--primary);
	}

	@media only screen and (max-width: 768px) {
		.main {
			position: absolute;
			bottom: 20px;
			width: calc(100% - 40px);
			padding: 10px;
			background:  var(--background);
		}

		.main p {
			background:  var(--background);
		}
	}
</style>
