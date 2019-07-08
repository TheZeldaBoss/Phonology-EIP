using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using App1.Models;
using App1.Views;
using App1.ViewModels;

namespace App1.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]

    
	public partial class AnimationViewPage : ContentPage
	{
        


        private String imagePath;
        public String ImagePath
        {
            get { return imagePath; }
            set
            {
                imagePath = value;
                OnPropertyChanged();
            }
        }

        private int nbFrames;

        public int NbFrames
        {
            get { return NbFrames; }
            set
            {
                nbFrames = value;
                OnPropertyChanged();
            }
        }

        private int currentFrame = 0;

        Label label;

        public AnimationViewPage(string path, int numberFrames)
        {
            imagePath = path;
            nbFrames = numberFrames;
            Label header = new Label
            {
                Text = "ImageButton",
                FontSize = 50,
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.Center
            };

            
            ImageButton imageButton = new ImageButton
            {
                Source = path + "/frame_0.png",
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.CenterAndExpand
            };
            imageButton.Clicked += OnAnimationClicked;
            

            // Build the page.
            Title = "Planète";
            Content = new StackLayout
            {
                Children =
                {
                    header,
                    imageButton
                }
            };
        }

        void OnAnimationClicked(object sender, EventArgs e)
        {

            currentFrame++;
            if (currentFrame == nbFrames)
                currentFrame = 0;
            ((ImageButton)sender).Source = imagePath + "/frame_" + currentFrame + ".png";
        }
    }
}