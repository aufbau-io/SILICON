<script>
	import { screenType } from '$lib/store/store';
</script>

	<main>



</main>

<style>
	main {
		width: 300px;
		height: 100%;

		margin: auto;

		display: flex;
		flex-flow: column nowrap;
		justify-content: space-between;
		/* align-items: flex-start; */
		border-left: solid 1px var(--primary-50);

	
		font-size: 12px;

		backdrop-filter: blur(10px);
	}

	.top {
		display: flex;
		flex-flow: column nowrap;
		gap: 20px;
		padding: 20px;
	}

	.title {
		width: 100%;
		height: 75px;
		border-bottom: solid 1px var(--primary);
		display: flex;
		align-items: flex-end;
		justify-content: center;
	}

	h1 {
		font-family: var(--font-header);
		font-size: 40px;
		letter-spacing: 0px;
		padding-bottom: 30px;
		color: var(--primary);
	}

	a.no-style {
		text-decoration: none !important;
	}

	.end {
		display: flex;
		width: calc(100% - 30px);
		flex-flow: column nowrap;
		align-self: flex-end;
		align-items: center;
		justify-content: flex-start;
		border: solid 1px var(--primary);

		margin: 15px;
		padding: 5px;
	}

	.end p, .end a {
		color: var(--primary);

		font-size: 12px;
		padding: 5px 10px;
		text-align: center;
	}

	@media only screen and (max-width: 768px) {
		main {
			backdrop-filter: none;
		}
	}
</style>
