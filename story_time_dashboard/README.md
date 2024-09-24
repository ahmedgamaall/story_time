# stories_admin_dashboard

## Admin Dashboard with Futter Web and Firebase

# :sparkles: Admin Dashboard with Futter Web

A new Flutter project.

## :art: System Design
```
.
├── lib                                         
    ├── core
    │   ├── di (get_it)   
    │   ├── networking (Firebase)
    │   ├── routing
    │   ├── helpers
    │   ├── theming            
    │   └── widgets
    │                 
    └── features
        └── home
              ├──  data
              │       ├── models
              │       └── repo 
              │ 
              ├──  logic
              │      └──  cubit / states
              │ 
              └──  ui
                    ├── screens
                    └── widgets 
```