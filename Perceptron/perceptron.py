import numpy as np

class Perceptron:
    """ Perceptron classifier.

    Parameters
    ------------
    eta : float
        Learning rate (between 0.0 and 1.0)
    n_iter : int
        Number of passes over the training dataset.
    random_state : int
        Random number generator seed for random weight 
        initialization.

    Attributes
    ------------
    w_ : 1d-array
        Weights after fitting.
    b_ : Scalar
        Bias unit after fitting.
    errors_ : list
        Number of misclassifications (updates) in each epoch.
    
    """

    def __init__(self, eta=0.01, n_iter=50, random_state=1):
        self.eta = eta
        self.n_iter = n_iter
        self.random_state = random_state
    
    def fit(self, X, y):
        """Fit training data.

        Parameters
        ------------
        X : {array-like}, shape = [n_samples, n_features]
            Training vectors, where n_samples is the number of samples
            and n_features is the number of features.

        y : array-like, shape = [n_samples]
            Target values (class labels).

        Returns
        ------------
        self : object


        Math
        ------------
        The weight update is performed according to the following rule:
        w_j := w_j + eta * (target - prediction) * x_ij
        b := b + eta * (target - prediction)

        """

        rng = np.random.default_rng(self.random_state)              # Initialize random number generator (Generator)
        self.w_ = rng.normal(loc=0.0, scale=0.01, size=X.shape[1])  # Initialize weights
        self.b_ = np.float64(0.)                                     # Initialize bias
        self.errors_ = []                                           # To track misclassifications


        # Training loop
        for _ in range(self.n_iter):                                # For each epoch
            errors = 0                                              # Initialize error count for this epoch 
            for xi, target in zip(X, y):                            # For each sample
                update = self.eta * (target - self.predict(xi))     # Calculate weight update
                self.w_ += update * xi                              # Update weights
                self.b_ += update                                   # Update bias
                errors += int(update != 0.0)                        # Count misclassifications
            self.errors_.append(errors)                             # Record errors for this epoch                                           
        return self
    
    def net_input(self, X):
        """Calculate net input"""
        return np.dot(X, self.w_) + self.b_
    
    def predict(self, X):
        """Return class label after unit step"""
        return np.where(self.net_input(X) >= 0.0, 1, 0)
