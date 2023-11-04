<script>
  import { xPlane, yPlane, zPlane, showRightSidebar, fullDatabaseView, showFilters } from '$lib/store/store';
  
  let toggleShowRightSidebar = () => {
    showRightSidebar.update(value => !value);
  };
  
  let toggleFullDatabaseView = () => {
    fullDatabaseView.update(value => !value);
  };

  let toggleShowFilters = () => {
    showFilters.update(value => !value);
  };

  // Function to toggle the visibility of a plane
  function togglePlaneVisibility(plane) {
    plane.update(current => ({ ...current, visible: !current.visible }));
  }

  // Function to update the value of a plane
  function updatePlaneValue(plane, newValue) {
    plane.update(current => ({ ...current, value: newValue }));
  }

  // For direct access in the markup, subscribe to the stores
  $: xPlaneValue = $xPlane;
  $: yPlaneValue = $yPlane;
  $: zPlaneValue = $zPlane;

  $: xPlaneClass = $xPlane.visible ? 'visible' : 'hidden';
  $: yPlaneClass = $yPlane.visible ? 'visible' : 'hidden';
  $: zPlaneClass = $zPlane.visible ? 'visible' : 'hidden';

  // $: showRightSidebarClass = $showRightSidebar ? 'visible' : 'hidden';
  $: fullDatabaseViewClass = $fullDatabaseView ? 'visible' : 'hidden';
  $: showFiltersClass = $showFilters ? 'hidden' : 'visible';
</script>
<header>
  <div class="controls">
    <!-- X Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(xPlane)}>
        <p><span class={xPlaneClass}>{xPlaneValue.name}</span> / <span class={xPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={xPlaneValue.value} min={xPlaneValue.min} max={xPlaneValue.max} on:input={(e) => updatePlaneValue(xPlane, parseFloat(e.target.value))}>
      <p class="control-value">{xPlaneValue.value}</p>
    </div>
    <!-- Y Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(yPlane)}>
        <p><span class={yPlaneClass}>{yPlaneValue.name}</span> / <span class={yPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={yPlaneValue.value} min={yPlaneValue.min} max={yPlaneValue.max} on:input={(e) => updatePlaneValue(yPlane, parseFloat(e.target.value))}>
      <p class="control-value">{yPlaneValue.value}</p>
    </div>
    <!-- Z Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(zPlane)}>
        <p><span class={zPlaneClass}>{zPlaneValue.name}</span> / <span class={zPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={zPlaneValue.value} min={zPlaneValue.min} max={zPlaneValue.max} on:input={(e) => updatePlaneValue(zPlane, parseFloat(e.target.value))}>
      <p class="control-value">{zPlaneValue.value}</p>
    </div>
    <!-- FILTERS -->
    <div class="control-group filters">
      <button on:click={() => toggleShowFilters()}>
        <p> <span class={showFiltersClass === 'visible' ? 'hidden' : 'visible'}>FILTERS [ 0 ]</span></p>
      </button>
    </div>
    
  </div>

  <div class="right-sidebar-controls">

      <button class="unit border-right" >
        <p class={fullDatabaseViewClass} on:click={() => toggleFullDatabaseView()} on:keydown={() => toggleFullDatabaseView()}>Full Databse View</p>
      </button>


      <!-- <button  class="unit" >
        <p class={showRightSidebarClass} on:click={() => toggleShowRightSidebar()} on:keydown={() => toggleShowRightSidebar()}>Show Results</p>
      </button> -->
      

  </div>
</header>

<style>
  header {
    color: var(--primary);
    width: 100%;
    height: 56px;
    margin: auto;
    z-index: 1;
    border-bottom: solid 1px var(--primary-50);
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    backdrop-filter: blur(10px);
  }

  .control-group {
    display: flex;
    flex-direction: row;
    width: 27.5%;
    gap: 10px;
    align-items: center;
    justify-content: center;
  }

  .control-group.filters {
    width: 17.5%;
  }
  
  .control-value {
    width: 1em;
    text-align: right;
    white-space: nowrap;
  }

  .controls {
    display: flex;
    justify-content: space-around;
    width: 100%;
    border-right: solid 1px var(--primary-50); 
  }

  .right-sidebar-controls {
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-around;
    width: 379px;
    max-width: 379px;
    min-width: 379px;
    height: 100%;
  }

  .unit {
    display: flex;
    flex-flow: column nowrap;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 20px;
  }

  .unit.border-right {
    /* border-right: solid 1px var(--primary-50); */
  }

  input[type=range] {
    width: 30%;
  }

  .visible {
    opacity: 1;
  }

  .hidden {
    opacity: 0.5;
  }
  
  @media only screen and (max-width: 1440px) {
		.controls {
			width: 100%;
		}

    .right-sidebar-controls {
      width: 100%;
    }
	}
</style>