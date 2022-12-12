<script>
</script>

<footer>
	<section>
		<div class="base">
			<p class="">silicon fm</p>
			<a class="sml" href="https://aufbau.io">ein aufbau ding</a>
		</div>
	</section>
</footer>

<style>
	footer {
		position: absolute;
		top: 0;
		width: 100vw;
		padding: 0 20px;
		background: #121212bb;
		z-index: 10;
		border-bottom: solid 1px var(--white-50);
		color: var(--white);
	}

	.base {
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 42px;
	}

	.semi {
		color: var(--white-20);
	}

	@media only screen and (max-width: 768px) {
		footer {
			z-index: 100;
			background: #121212;
		}
	}
</style>
